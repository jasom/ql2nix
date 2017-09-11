
{ buildLispPackage, stdenv, fetchurl, lisp-project_ubiquitous, 
   lisp_bordeaux-threads,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "ubiquitous-concurrent";
      
      sourceProject = "${lisp-project_ubiquitous}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads}";
      name = "lisp_ubiquitous-concurrent-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
