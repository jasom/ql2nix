
{ buildLispPackage, stdenv, fetchurl, lisp-project_humbler, 
   lisp_closer-mop, lisp_local-time, lisp_trivial-mimes, lisp_yason, lisp_south,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_local-time lisp_trivial-mimes lisp_yason lisp_south  ];
      inherit stdenv;
      systemName = "humbler";
      
      sourceProject = "${lisp-project_humbler}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_local-time} ${lisp_trivial-mimes} ${lisp_yason} ${lisp_south}";
      name = "lisp_humbler-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
