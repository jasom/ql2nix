
{ buildLispPackage, stdenv, fetchurl, lisp-project_tm, 
   lisp_local-time,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time  ];
      inherit stdenv;
      systemName = "tm";
      
      sourceProject = "${lisp-project_tm}";
      patches = [];
      lisp_dependencies = "${lisp_local-time}";
      name = "lisp_tm-v0.8";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
