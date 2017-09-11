
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-devil, 
   lisp_cepl, lisp_cl-devil,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl lisp_cl-devil  ];
      inherit stdenv;
      systemName = "cepl.devil";
      
      sourceProject = "${lisp-project_cepl-devil}";
      patches = [];
      lisp_dependencies = "${lisp_cepl} ${lisp_cl-devil}";
      name = "lisp_cepl-devil-release-quicklisp-ea5f8514-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
