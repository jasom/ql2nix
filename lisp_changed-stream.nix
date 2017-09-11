
{ buildLispPackage, stdenv, fetchurl, lisp-project_changed-stream, 
   
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "changed-stream";
      
      sourceProject = "${lisp-project_changed-stream}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_changed-stream-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
