
{ buildLispPackage, stdenv, fetchurl, lisp-project_jp-numeral, 
   lisp_babel, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_alexandria  ];
      inherit stdenv;
      systemName = "jp-numeral";
      
      sourceProject = "${lisp-project_jp-numeral}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_alexandria}";
      name = "lisp_jp-numeral-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
