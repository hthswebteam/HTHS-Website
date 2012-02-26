<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Output Class Extension
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Output
 * @author		Jeffery Mooneyham
 */
 
/**Changes: 
 
 *Added the display_output function as a member of the output class
 
 */
 
 class MY_Output extends CI_Output {
 
	public function __construct()
	{
		//Call parent constructor
		parent::__construct();
		
		/*	Dev Note: 
				The function get_instance() cannot be called in the constructor when extending a core class as the 
				controller class has not been loaded when this constructor is executed.
		*/
	}
	
	/**
	 * Loads the appropriate headers and page content and checks if site is offline
	 *
	 * @access	public
	 * @param	file
	 * @param	data
	 * @param	headers
	 * @return	none
	 */
	public function display_output($view, $data = null, $options = array()) 
	{
		$CI =& get_instance();
		
		$CI->db->where('setting_name', 'online');
		$status = $CI->db->get('site_settings')->row();
		
		if($status->setting_value == 0 && $CI->uri->segment(1) != 'admin') 
		{
			$CI->db->where('setting_name', 'offline_message');
			$data['offline_message'] = $CI->db->get('site_settings')->row()->setting_value;
			
			$CI->load->view('offline',$data);
		}
		else
		{
			if (!isset($options['section'])) {
				$templatedir = 'wrapper';
			} else {
				$templatedir = 'wrapper/' . $options['section'];
			}
			
			$CI->load->view($templatedir  . '/header');
			$CI->load->view($view, $data);
			$CI->load->view($templatedir  . '/footer');
		}
	}
	
}

?>