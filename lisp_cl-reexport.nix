
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-reexport, 
   lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-reexport";
      
      sourceProject = "${lisp-project_cl-reexport}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_cl-reexport-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
