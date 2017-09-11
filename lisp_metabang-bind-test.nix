
{ buildLispPackage, stdenv, fetchurl, lisp-project_metabang-bind, 
   lisp_lift, lisp_metabang-bind,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_metabang-bind  ];
      inherit stdenv;
      systemName = "metabang-bind-test";
      
      sourceProject = "${lisp-project_metabang-bind}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_metabang-bind}";
      name = "lisp_metabang-bind-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
