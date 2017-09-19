
{ buildLispPackage, stdenv, fetchurl, lisp-project_hunchentoot, 
   lisp_usocket, lisp_trivial-backtrace, lisp_rfc2388, lisp_md5, lisp_cl-ssl, lisp_flexi-streams, lisp_cl-ppcre, lisp_cl-fad, lisp_cl-base64, lisp_chunga,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_trivial-backtrace lisp_rfc2388 lisp_md5 lisp_cl-ssl lisp_flexi-streams lisp_cl-ppcre lisp_cl-fad lisp_cl-base64 lisp_chunga  ];
      inherit stdenv;
      systemName = "hunchentoot";
      
      sourceProject = "${lisp-project_hunchentoot}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_trivial-backtrace} ${lisp_rfc2388} ${lisp_md5} ${lisp_cl-ssl} ${lisp_flexi-streams} ${lisp_cl-ppcre} ${lisp_cl-fad} ${lisp_cl-base64} ${lisp_chunga}";
      name = "lisp_hunchentoot-v1.2.37";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
