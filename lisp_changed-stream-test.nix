
{ buildLispPackage, stdenv, fetchurl, lisp-project_changed-stream, 
   lisp_changed-stream,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_changed-stream  ];
      inherit stdenv;
      systemName = "changed-stream.test";
      
      sourceProject = "${lisp-project_changed-stream}";
      patches = [];
      lisp_dependencies = "${lisp_changed-stream}";
      name = "lisp_changed-stream-test-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
