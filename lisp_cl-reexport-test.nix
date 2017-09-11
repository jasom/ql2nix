
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-reexport, 
   lisp_cl-reexport, lisp_cl-test-more,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-reexport lisp_cl-test-more  ];
      inherit stdenv;
      systemName = "cl-reexport-test";
      
      sourceProject = "${lisp-project_cl-reexport}";
      patches = [];
      lisp_dependencies = "${lisp_cl-reexport} ${lisp_cl-test-more}";
      name = "lisp_cl-reexport-test-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
