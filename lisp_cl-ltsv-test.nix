
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ltsv, 
   lisp_cl-ltsv, lisp_cl-test-more,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ltsv lisp_cl-test-more  ];
      inherit stdenv;
      systemName = "cl-ltsv-test";
      
      sourceProject = "${lisp-project_cl-ltsv}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ltsv} ${lisp_cl-test-more}";
      name = "lisp_cl-ltsv-test-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
