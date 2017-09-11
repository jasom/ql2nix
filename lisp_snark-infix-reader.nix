
{ buildLispPackage, stdenv, fetchurl, lisp-project_snark, 
   lisp_snark-auxiliary-packages, lisp_snark-lisp,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_snark-auxiliary-packages lisp_snark-lisp  ];
      inherit stdenv;
      systemName = "snark-infix-reader";
      
      sourceProject = "${lisp-project_snark}";
      patches = [];
      lisp_dependencies = "${lisp_snark-auxiliary-packages} ${lisp_snark-lisp}";
      name = "lisp_snark-infix-reader-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
