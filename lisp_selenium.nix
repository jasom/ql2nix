
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-selenium, 
   lisp_cxml, lisp_drakma,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cxml lisp_drakma  ];
      inherit stdenv;
      systemName = "selenium";
      
      sourceProject = "${lisp-project_cl-selenium}";
      patches = [];
      lisp_dependencies = "${lisp_cxml} ${lisp_drakma}";
      name = "lisp_selenium-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
