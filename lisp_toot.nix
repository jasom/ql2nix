
{ buildLispPackage, stdenv, fetchurl, lisp-project_toot, 
   lisp_puri, lisp_usocket, lisp_trivial-backtrace, lisp_md5, lisp_cl-ssl, lisp_flexi-streams, lisp_cl-ppcre, lisp_cl-fad, lisp_cl-base64, lisp_chunga, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_puri lisp_usocket lisp_trivial-backtrace lisp_md5 lisp_cl-ssl lisp_flexi-streams lisp_cl-ppcre lisp_cl-fad lisp_cl-base64 lisp_chunga lisp_alexandria  ];
      inherit stdenv;
      systemName = "toot";
      
      sourceProject = "${lisp-project_toot}";
      patches = [];
      lisp_dependencies = "${lisp_puri} ${lisp_usocket} ${lisp_trivial-backtrace} ${lisp_md5} ${lisp_cl-ssl} ${lisp_flexi-streams} ${lisp_cl-ppcre} ${lisp_cl-fad} ${lisp_cl-base64} ${lisp_chunga} ${lisp_alexandria}";
      name = "lisp_toot-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
