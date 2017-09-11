
{ buildLispPackage, stdenv, fetchurl, lisp-project_listoflist, 
   lisp_clunit, lisp_xarray,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clunit lisp_xarray  ];
      inherit stdenv;
      systemName = "listoflist";
      
      sourceProject = "${lisp-project_listoflist}";
      patches = [];
      lisp_dependencies = "${lisp_clunit} ${lisp_xarray}";
      name = "lisp_listoflist-20140826-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
