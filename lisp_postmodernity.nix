
{ buildLispPackage, stdenv, fetchurl, lisp-project_postmodernity, 
   lisp_postmodern, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_postmodern lisp_alexandria  ];
      inherit stdenv;
      systemName = "postmodernity";
      
      sourceProject = "${lisp-project_postmodernity}";
      patches = [];
      lisp_dependencies = "${lisp_postmodern} ${lisp_alexandria}";
      name = "lisp_postmodernity-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
