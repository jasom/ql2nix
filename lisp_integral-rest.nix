
{ buildLispPackage, stdenv, fetchurl, lisp-project_integral-rest, 
   lisp_alexandria, lisp_cl-inflector, lisp_closer-mop, lisp_integral, lisp_jonathan, lisp_map-set, lisp_ningle,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-inflector lisp_closer-mop lisp_integral lisp_jonathan lisp_map-set lisp_ningle  ];
      inherit stdenv;
      systemName = "integral-rest";
      
      sourceProject = "${lisp-project_integral-rest}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-inflector} ${lisp_closer-mop} ${lisp_integral} ${lisp_jonathan} ${lisp_map-set} ${lisp_ningle}";
      name = "lisp_integral-rest-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
