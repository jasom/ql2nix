
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gdata, 
   lisp_cl-json, lisp_local-time, lisp_string-case, lisp_trivial-utf-8, lisp_cl-fad, lisp_closer-mop, lisp_gzip-stream, lisp_url-rewrite, lisp_xpath, lisp_cxml, lisp_drakma, lisp_split-sequence,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_local-time lisp_string-case lisp_trivial-utf-8 lisp_cl-fad lisp_closer-mop lisp_gzip-stream lisp_url-rewrite lisp_xpath lisp_cxml lisp_drakma lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-gdata";
      
      sourceProject = "${lisp-project_cl-gdata}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_local-time} ${lisp_string-case} ${lisp_trivial-utf-8} ${lisp_cl-fad} ${lisp_closer-mop} ${lisp_gzip-stream} ${lisp_url-rewrite} ${lisp_xpath} ${lisp_cxml} ${lisp_drakma} ${lisp_split-sequence}";
      name = "lisp_cl-gdata-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
