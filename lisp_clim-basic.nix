
{ buildLispPackage, stdenv, fetchurl, lisp-project_mcclim, 
   lisp_bordeaux-threads, lisp_clim-lisp, lisp_flexichain, lisp_spatial-trees, lisp_trivial-features, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_clim-lisp lisp_flexichain lisp_spatial-trees lisp_trivial-features lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "clim-basic";
      
      sourceProject = "${lisp-project_mcclim}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_clim-lisp} ${lisp_flexichain} ${lisp_spatial-trees} ${lisp_trivial-features} ${lisp_trivial-garbage}";
      name = "lisp_clim-basic-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
