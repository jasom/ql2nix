
{ buildLispPackage, stdenv, fetchurl, lisp-project_lass-flexbox, 
   lisp_lass,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lass  ];
      inherit stdenv;
      systemName = "lass-flexbox";
      
      sourceProject = "${lisp-project_lass-flexbox}";
      patches = [];
      lisp_dependencies = "${lisp_lass}";
      name = "lisp_lass-flexbox-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
