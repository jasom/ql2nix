
{ buildLispPackage, stdenv, fetchurl, lisp-project_mcclim, 
   lisp_clx, lisp_swank, lisp_trivial-features, lisp_trivial-garbage, lisp_bordeaux-threads, lisp_flexichain, lisp_spatial-trees, lisp_closer-mop, lisp_trivial-gray-streams, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clx lisp_swank lisp_trivial-features lisp_trivial-garbage lisp_bordeaux-threads lisp_flexichain lisp_spatial-trees lisp_closer-mop lisp_trivial-gray-streams lisp_alexandria  ];
      inherit stdenv;
      systemName = "mcclim-clx/output";
      
      sourceProject = "${lisp-project_mcclim}";
      patches = [];
      lisp_dependencies = "${lisp_clx} ${lisp_swank} ${lisp_trivial-features} ${lisp_trivial-garbage} ${lisp_bordeaux-threads} ${lisp_flexichain} ${lisp_spatial-trees} ${lisp_closer-mop} ${lisp_trivial-gray-streams} ${lisp_alexandria}";
      name = "lisp_mcclim-clx-output-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
