
{ buildLispPackage, stdenv, fetchurl, lisp-project_osicat, 
   lisp_osicat, lisp_rt,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_osicat lisp_rt  ];
      inherit stdenv;
      systemName = "osicat-tests";
      
      sourceProject = "${lisp-project_osicat}";
      patches = [];
      lisp_dependencies = "${lisp_osicat} ${lisp_rt}";
      name = "lisp_osicat-tests-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
