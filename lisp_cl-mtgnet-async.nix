
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-mtgnet, 
   lisp_cl-async, lisp_blackbird, lisp_cl-netstring-, lisp_cl-json, lisp_trivial-utf-8,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-async lisp_blackbird lisp_cl-netstring- lisp_cl-json lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "cl-mtgnet-async";
      
      sourceProject = "${lisp-project_cl-mtgnet}";
      patches = [];
      lisp_dependencies = "${lisp_cl-async} ${lisp_blackbird} ${lisp_cl-netstring-} ${lisp_cl-json} ${lisp_trivial-utf-8}";
      name = "lisp_cl-mtgnet-async-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
