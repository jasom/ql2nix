
{ buildLispPackage, stdenv, fetchurl, lisp-project_cue-parser, 
   lisp_flexi-streams, lisp_esrap,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_esrap  ];
      inherit stdenv;
      systemName = "cue-parser";
      
      sourceProject = "${lisp-project_cue-parser}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_esrap}";
      name = "lisp_cue-parser-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
