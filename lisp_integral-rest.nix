
{ buildLispPackage, stdenv, fetchurl, lisp-project_integral-rest, 
   lisp_cl-inflector, lisp_ningle, lisp_integral, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-inflector lisp_ningle lisp_integral lisp_alexandria  ];
      inherit stdenv;
      systemName = "integral-rest";
      
      sourceProject = "${lisp-project_integral-rest}";
      patches = [];
      lisp_dependencies = "${lisp_cl-inflector} ${lisp_ningle} ${lisp_integral} ${lisp_alexandria}";
      name = "lisp_integral-rest-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
