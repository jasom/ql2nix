
{ buildLispPackage, stdenv, fetchurl, lisp-project_humbler, 
   lisp_south, lisp_yason, lisp_trivial-mimes, lisp_local-time, lisp_closer-mop,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_south lisp_yason lisp_trivial-mimes lisp_local-time lisp_closer-mop  ];
      inherit stdenv;
      systemName = "humbler";
      
      sourceProject = "${lisp-project_humbler}";
      patches = [];
      lisp_dependencies = "${lisp_south} ${lisp_yason} ${lisp_trivial-mimes} ${lisp_local-time} ${lisp_closer-mop}";
      name = "lisp_humbler-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
