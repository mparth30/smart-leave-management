using System;

namespace SmartLeave.Models
{
    public class User
    {
        public int UserID { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
        public int? DeptID { get; set; }
    }
}
