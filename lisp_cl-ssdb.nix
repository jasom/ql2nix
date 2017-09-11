
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ssdb, 
   lisp_babel, lisp_cl-ppcre, lisp_flexi-streams, lisp_parse-number, lisp_rutils, lisp_usocket,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-ppcre lisp_flexi-streams lisp_parse-number lisp_rutils lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-ssdb";
      
      sourceProject = "${lisp-project_cl-ssdb}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-ppcre} ${lisp_flexi-streams} ${lisp_parse-number} ${lisp_rutils} ${lisp_usocket}";
      name = "lisp_cl-ssdb-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
