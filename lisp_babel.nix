
{ buildLispPackage, stdenv, fetchurl, lisp-project_babel, 
   lisp_alexandria, lisp_trivial-features,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_trivial-features  ];
      inherit stdenv;
      systemName = "babel";
      
      sourceProject = "${lisp-project_babel}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_trivial-features}";
      name = "lisp_babel-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
