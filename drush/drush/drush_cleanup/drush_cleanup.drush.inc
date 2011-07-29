<?php
// $Id: drush_cleanup.drush.inc,v 1.1 2010/06/25 07:37:06 chrischarlton Exp $

/**
 * @file
 *   Cleanup command for Drush.
 */

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
    'description' => "Clean out non-critical text files that ship with Drupal.",
    'aliases' => array('cu'),
    'bootstrap' => DRUSH_BOOTSTRAP_DRUSH, 
  );

  return $items;
}

/**
 * Implementation of hook_drush_help().
 *
 * This function is called whenever a drush user calls
 * 'drush help <name-of-your-command>'
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
      return dt("Cleans up a Drupal site by removing the text files like UPGRADE.txt, MAINTAINERS.txt, etc.; files not needed to run a Drupal site.");
  }
}

/*
 * Implementation of drush_hook_COMMAND_validate().
 */
function drush_drush_cleanup_validate() {
}

/**
 * Returns array of files to delete.
 */
function drush_cleanup_files_list() {
  // List of files to delete
  $files   = array();
  $files[] = 'CHANGELOG.txt';
  $files[] = 'COPYRIGHT.txt';
  $files[] = 'INSTALL.mysql.txt';
  $files[] = 'INSTALL.pgsql.txt';
  $files[] = 'INSTALL.txt';
  $files[] = 'LICENSE.txt';
  $files[] = 'MAINTAINERS.txt';
  $files[] = 'UPGRADE.txt';
  $files[] = 'modules/README.txt';
  $files[] = 'themes/README.txt';
  $files[] = 'sites/all/README.txt';
  return $files;
}

/**
 * Returns array of files to delete.
 */
function drush_cleanup_files_from_drupal($files) {
  $files_deleted = 0;
  foreach ($files as $file) {
    if (file_exists($file)) {
      if(unlink($file)) {
        $files_deleted++;
        // If the delete was successfull we print out a message.
        drush_log(dt('!filename was cleaned out.', array('!filename' => $file)), 'success');
      } 
      else {
        // Notify the user there was a problem deleting the file, which is usually due to permissions.
        drush_log(dt('There was a problem trying to delete "!filename" (check the file permissions)', array('!filename' => $file)), 'error');
      }
    }
  }
  // If no files needed to be cleaned out we let the user know.
  if ($files_deleted <= 0) {
    drush_log(dt('No files needed to be cleaned out.'), 'ok');
  }
}

/**
 * Drush cleanup command callback.
 */
function drush_drush_cleanup_cleanup() {
  drush_cleanup_files_from_drupal(drush_cleanup_files_list());
}
