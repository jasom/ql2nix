
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-devil, 
   lisp_cl-devil, lisp_cepl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-devil lisp_cepl  ];
      inherit stdenv;
      systemName = "cepl.devil";
      
      sourceProject = "${lisp-project_cepl-devil}";
      patches = [];
      lisp_dependencies = "${lisp_cl-devil} ${lisp_cepl}";
      name = "lisp_cepl-devil-release-quicklisp-ea5f8514-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
