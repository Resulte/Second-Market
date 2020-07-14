function go_search(){
            var search_title = document.getElementById('search').value;
            //alert(search_title);
            window.location.href="/after_search?search_title="+search_title;
        }