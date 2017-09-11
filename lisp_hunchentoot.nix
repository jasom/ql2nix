
{ buildLispPackage, stdenv, fetchurl, lisp-project_hunchentoot, 
   lisp_bordeaux-threads, lisp_chunga, lisp_cl-ssl, lisp_cl-base64, lisp_cl-fad, lisp_cl-ppcre, lisp_flexi-streams, lisp_md5, lisp_rfc2388, lisp_trivial-backtrace, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_chunga lisp_cl-ssl lisp_cl-base64 lisp_cl-fad lisp_cl-ppcre lisp_flexi-streams lisp_md5 lisp_rfc2388 lisp_trivial-backtrace lisp_usocket  ];
      inherit stdenv;
      systemName = "hunchentoot";
      
      sourceProject = "${lisp-project_hunchentoot}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_chunga} ${lisp_cl-ssl} ${lisp_cl-base64} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_flexi-streams} ${lisp_md5} ${lisp_rfc2388} ${lisp_trivial-backtrace} ${lisp_usocket}";
      name = "lisp_hunchentoot-v1.2.37";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
