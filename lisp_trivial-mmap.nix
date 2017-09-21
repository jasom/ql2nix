
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-mmap, 
   lisp_osicat, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_osicat lisp_alexandria  ];
      inherit stdenv;
      systemName = "trivial-mmap";
      
      sourceProject = "${lisp-project_trivial-mmap}";
      patches = [];
      lisp_dependencies = "${lisp_osicat} ${lisp_alexandria}";
      name = "lisp_trivial-mmap-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
