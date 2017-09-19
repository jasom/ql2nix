
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-finalizers, 
   lisp_hu-dwim-stefil, lisp_fare-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil lisp_fare-utils  ];
      inherit stdenv;
      systemName = "asdf-finalizers-test/2";
      
      sourceProject = "${lisp-project_asdf-finalizers}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil} ${lisp_fare-utils}";
      name = "lisp_asdf-finalizers-test-2-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
