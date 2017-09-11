
{ buildLispPackage, stdenv, fetchurl, lisp-project_tinaa, 
   lisp_lift, lisp_tinaa,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_tinaa  ];
      inherit stdenv;
      systemName = "tinaa-test";
      
      sourceProject = "${lisp-project_tinaa}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_tinaa}";
      name = "lisp_tinaa-test-20140211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
