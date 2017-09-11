
{ buildLispPackage, stdenv, fetchurl, lisp-project_gendl, 
   lisp_gwl-graphics, lisp_tree,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_gwl-graphics lisp_tree  ];
      inherit stdenv;
      systemName = "tasty";
      
      sourceProject = "${lisp-project_gendl}";
      patches = [];
      lisp_dependencies = "${lisp_gwl-graphics} ${lisp_tree}";
      name = "lisp_tasty-devo-0272a167-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
