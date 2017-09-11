
{ buildLispPackage, stdenv, fetchurl, lisp-project_snark, 
   lisp_snark-auxiliary-packages, lisp_snark-lisp, lisp_snark-sparse-array,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_snark-auxiliary-packages lisp_snark-lisp lisp_snark-sparse-array  ];
      inherit stdenv;
      systemName = "snark-numbering";
      
      sourceProject = "${lisp-project_snark}";
      patches = [];
      lisp_dependencies = "${lisp_snark-auxiliary-packages} ${lisp_snark-lisp} ${lisp_snark-sparse-array}";
      name = "lisp_snark-numbering-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
