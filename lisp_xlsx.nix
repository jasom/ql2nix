
{ buildLispPackage, stdenv, fetchurl, lisp-project_xlsx, 
   lisp_flexi-streams, lisp_xmls, lisp_zip,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_xmls lisp_zip  ];
      inherit stdenv;
      systemName = "xlsx";
      
      sourceProject = "${lisp-project_xlsx}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_xmls} ${lisp_zip}";
      name = "lisp_xlsx-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
