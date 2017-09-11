
{ buildLispPackage, stdenv, fetchurl, lisp-project_toot, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_chunga, lisp_cl-ssl, lisp_cl-base64, lisp_cl-fad, lisp_cl-ppcre, lisp_flexi-streams, lisp_md5, lisp_puri, lisp_trivial-backtrace, lisp_usocket,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_chunga lisp_cl-ssl lisp_cl-base64 lisp_cl-fad lisp_cl-ppcre lisp_flexi-streams lisp_md5 lisp_puri lisp_trivial-backtrace lisp_usocket  ];
      inherit stdenv;
      systemName = "toot";
      
      sourceProject = "${lisp-project_toot}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_chunga} ${lisp_cl-ssl} ${lisp_cl-base64} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_flexi-streams} ${lisp_md5} ${lisp_puri} ${lisp_trivial-backtrace} ${lisp_usocket}";
      name = "lisp_toot-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
