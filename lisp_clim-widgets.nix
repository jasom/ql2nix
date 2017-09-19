
{ buildLispPackage, stdenv, fetchurl, lisp-project_clim-widgets, 
   lisp_manifest, lisp_nsort, lisp_perlre, lisp_local-time, lisp_simple-date-time, lisp_mcclim,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_manifest lisp_nsort lisp_perlre lisp_local-time lisp_simple-date-time lisp_mcclim  ];
      inherit stdenv;
      systemName = "clim-widgets";
      
      sourceProject = "${lisp-project_clim-widgets}";
      patches = [];
      lisp_dependencies = "${lisp_manifest} ${lisp_nsort} ${lisp_perlre} ${lisp_local-time} ${lisp_simple-date-time} ${lisp_mcclim}";
      name = "lisp_clim-widgets-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
