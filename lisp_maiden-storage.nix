
{ buildLispPackage, stdenv, fetchurl, lisp-project_maiden, 
   lisp_maiden, lisp_pathname-utils, lisp_ubiquitous-concurrent,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_maiden lisp_pathname-utils lisp_ubiquitous-concurrent  ];
      inherit stdenv;
      systemName = "maiden-storage";
      
      sourceProject = "${lisp-project_maiden}";
      patches = [];
      lisp_dependencies = "${lisp_maiden} ${lisp_pathname-utils} ${lisp_ubiquitous-concurrent}";
      name = "lisp_maiden-storage-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
