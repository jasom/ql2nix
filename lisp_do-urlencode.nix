
{ buildLispPackage, stdenv, fetchurl, lisp-project_do-urlencode, 
   lisp_babel-streams, lisp_babel,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel-streams lisp_babel  ];
      inherit stdenv;
      systemName = "do-urlencode";
      
      sourceProject = "${lisp-project_do-urlencode}";
      patches = [];
      lisp_dependencies = "${lisp_babel-streams} ${lisp_babel}";
      name = "lisp_do-urlencode-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
