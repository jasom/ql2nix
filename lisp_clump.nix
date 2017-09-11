
{ buildLispPackage, stdenv, fetchurl, lisp-project_clump, 
   lisp_clump-2-3-tree, lisp_clump-binary-tree,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clump-2-3-tree lisp_clump-binary-tree  ];
      inherit stdenv;
      systemName = "clump";
      
      sourceProject = "${lisp-project_clump}";
      patches = [];
      lisp_dependencies = "${lisp_clump-2-3-tree} ${lisp_clump-binary-tree}";
      name = "lisp_clump-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
