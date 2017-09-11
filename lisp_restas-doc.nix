
{ buildLispPackage, stdenv, fetchurl, lisp-project_restas, 
   lisp_restas, lisp_restas-directory-publisher, lisp_sphinx,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_restas lisp_restas-directory-publisher lisp_sphinx  ];
      inherit stdenv;
      systemName = "restas-doc";
      
      sourceProject = "${lisp-project_restas}";
      patches = [];
      lisp_dependencies = "${lisp_restas} ${lisp_restas-directory-publisher} ${lisp_sphinx}";
      name = "lisp_restas-doc-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
