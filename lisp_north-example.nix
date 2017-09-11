
{ buildLispPackage, stdenv, fetchurl, lisp-project_north, 
   lisp_north, lisp_hunchentoot, lisp_clip,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_north lisp_hunchentoot lisp_clip  ];
      inherit stdenv;
      systemName = "north-example";
      
      sourceProject = "${lisp-project_north}";
      patches = [];
      lisp_dependencies = "${lisp_north} ${lisp_hunchentoot} ${lisp_clip}";
      name = "lisp_north-example-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
