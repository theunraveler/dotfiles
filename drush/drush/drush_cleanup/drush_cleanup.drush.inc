<?php

/**
 * @file
 *   Cleanup command for Drush.
 */


/**
 * Implementation of hook_drush_init().
 */
function drush_cleanup_drush_init() {
  define('DRUSH_CLEANUP_DIRECTORY', dirname(__FILE__));
  define('DRUSH_CLEANUP_CONTRIB_DIRECTORY', DRUSH_CLEANUP_DIRECTORY .'/contrib');
  define('DRUSH_CLEANUP_INI_FILE_EXTENSION', '.cleanup.ini');
}

/**
 * Implementation of hook_drush_command().
 *
 * @See drush_parse_command() for a list of recognized keys.
 *
 * @return
 *   An associative array describing each command.
 */
function drush_cleanup_drush_command() {
	$items = array();

	$items['cleanup'] = array(
    'description' => "Clean out non-critical text files that ship with Drupal core.",
    'aliases' => array('cu'),
    'bootstrap' => DRUSH_BOOTSTRAP_DRUSH,
    'options' => array(
      //'file'     => 'Path to a Drush Cleanup file (files need to end in ".cleanup.ini").',
      'simulate' => 'Output a preview list of what files would be cleaned out without deleting them.',
      'themes'   => 'Comma separated list of core themes to clean out, except for Garland & Minelli. (all, bluemarine, chameleon, marvin, pushbutton)',
	  ),
    'examples' => array(
      'drush cleanup' => 'Cleans out common text files not needed to run Drupal.',
      'drush cleanup --themes=all' => 'Cleans out optional themes and all common text files.',
      'drush cleanup --themes=pushbutton' => 'Cleans out the `pushbutton` theme and all common text files.',
      'drush cleanup --simulate' => 'Simple simulation of a cleanup. (does not delete any files)',
      //'drush cleanup --file=/custom.cleanup.ini' => 'Loads a custom Drush Cleanup file.',
	  ),
	);

	return $items;
}

/**
 * Implementation of hook_drush_help().
 *
 * @param
 *   A string with the help section (prepend with 'drush:')
 *
 * @return
 *   A string with the help text for your command.
 */
function drush_cleanup_drush_help($section) {
	switch ($section) {
		case 'drush:cleanup':
			return dt("Cleans up a Drupal site by removing text files like CHANGELOG.txt, UPGRADE.txt, etc.; cleans out files not needed to run a Drupal site.");
	}
}


/**
 * Returns array of files to delete.
 */
function drush_cleanup_files_list() {
  $files = array();
  
  $drupal_directory = _drush_core_directory();
  // Make sure the directory doesn't equal "/".
  if ($drupal_directory == '/' || empty($drupal_directory)) {
  	drush_log(dt('Your Drupal folder appears to be set up in an unexpected way and may need to be be cleaned up manually.'), 'warning');
  	return $files;
  }
	
	// Load ini files that come with this plugin.
  $files_list = _drush_cleanup_parse_inifiles(_drush_cleanup_inidefaults());

  // Check Drupal version.
  $drupal_version = drush_drupal_version();
  $drupal_major_version = drush_drupal_major_version($drupal_directory);
  drush_log(dt('Drupal version to clean up: !version', array('!version' => $drupal_version)));
	
  // Check files.
  if (isset($files_list[$drupal_major_version]['file'])) {
  	foreach ($files_list[$drupal_major_version]['file'] as $file) {
  		$files[] = $drupal_directory .'/'. $file;
  	}
  }
  // Check themes.
  $remove_themes = drush_get_context_options('themes');
  if (isset($remove_themes['cli'])) {
  	$themes = $remove_themes['cli']; // --themes=???
	  if (isset($files_list[$drupal_major_version]['theme'])) {
  		$themes_dir = $drupal_directory .'/themes'; // Theme directory path.
	  	foreach ($files_list[$drupal_major_version]['theme'] as $directory) {
	  		// Adds from a list of themes.
	  		if (count(explode(',', $themes) > 1)) {
		  		$themes_list = explode(',', $themes); // List of specific themes.
	  			foreach ($themes_list as $theme) {
	  				$file = $themes_dir .'/'. $theme;
		  			if (!in_array($file, $files) && in_array($theme, $files_list[$drupal_major_version]['theme'])) {
			  		  $files[] = $file;
		  			}
	  			}
	  		}
	  		// Adds if allowed.
	  		elseif ($themes === 'all' || $themes === $directory) {
	  			$file = $themes_dir .'/'. $directory;
	  			if (!in_array($file, $files)) {
	  		  	$files[] = $file;
	  			}
	  		}
	  	}
	  }
	  unset($themes); // Clean up.
  }
  unset($remove_themes); // Clean up.
    
  drush_log(dt("\nMarked for removal:\n - !files\n", array('!files' => implode("\n - ", $files))));

  unset($files_list, $drupal_version, $drupal_major_version, $drupal_directory); // Clean up.
  return $files;
}

/**
 * Returns array of files to delete.
 */
function drush_cleanup_files_from_drupal($files) {
	$files_deleted = 0;
	foreach ($files as $file) {
		// Check if path is a file.
    if (drush_delete_dir($file)) {
		  $files_deleted++;
		  // If the delete was successfull we print out a message.
		  drush_print(dt('!filename was cleaned out.', array('!filename' => $file)));
    }
	  else {
	  	if (file_exists($file)) {
			  // Notify the user there was a problem deleting the file, which is usually due to permissions.
		    drush_log(dt('There was a problem trying to delete: !filename (check file permissions)', array('!filename' => $file)), 'error');
	    }
		  else {
			  // Notify the user the file didn't exist.
			  drush_log(dt('Missing: !filename', array('!filename' => $file)), 'notice');
		  }
	  }
	}
	// If no files needed to be cleaned out we let the user know.
	if ($files_deleted == 0) {
		drush_print(dt("No files were cleaned out.\n"), 'ok');
	}
	// Clean up.
	unset($files_deleted);
}



/**
 * Drush cleanup command callback.
 */
function drush_drush_cleanup_cleanup() {
	$simulate = drush_get_context_options('simulate'); // --simulate
  $files = drush_cleanup_files_list();
	if (!isset($simulate['cli'])) {
		drush_cleanup_files_from_drupal($files);
	}
}



/**
 * Returns a list of default Drush Cleanup ini files.
 * @return Array
 */
function _drush_cleanup_inidefaults() {
	$dir = DRUSH_CLEANUP_CONTRIB_DIRECTORY;
	if (is_dir($dir)) {
		if ($dh = opendir($dir)) {
			$files = array();
			while (($file = readdir($dh)) !== false) {
				if (($file !== '.' && $file !== '..') && substr($file, (strlen(DRUSH_CLEANUP_INI_FILE_EXTENSION) * -1)) === DRUSH_CLEANUP_INI_FILE_EXTENSION) {
					// Add to list of files.
					$files[] = DRUSH_CLEANUP_CONTRIB_DIRECTORY .'/'. $file;
				}
			}
			closedir($dh);
			return $files;
		}
	}
	// Clean up.
	unset($dir);
}


/**
 * Parse list of default Drush Cleanup ini files.
 * @return Array
 */
function _drush_cleanup_parse_inifiles($ini_files) {
	if (count($ini_files)) {
    $files = array();
    foreach ($ini_files as $ini_file) {
      $file = parse_ini_file($ini_file, true);
      $file_core_version = $file['core'];
      $files[$file_core_version] = $file;
      // Clean up.
      unset($file_core_version, $file);
    }
    return $files;
  }
  return;
}
