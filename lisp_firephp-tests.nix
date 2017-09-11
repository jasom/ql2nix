
{ buildLispPackage, stdenv, fetchurl, lisp-project_firephp, 
   lisp_cl-json, lisp_firephp, lisp_hu-dwim-stefil, lisp_hunchentoot,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_firephp lisp_hu-dwim-stefil lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "firephp-tests";
      
      sourceProject = "${lisp-project_firephp}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_firephp} ${lisp_hu-dwim-stefil} ${lisp_hunchentoot}";
      name = "lisp_firephp-tests-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
