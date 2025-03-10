Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1trZKd-0007YF-8E
	for mharc-qemu-rust@gnu.org; Mon, 10 Mar 2025 05:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1trZKb-0007Xw-Vn
 for qemu-rust@nongnu.org; Mon, 10 Mar 2025 05:21:54 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1trZKZ-0006W8-KC
 for qemu-rust@nongnu.org; Mon, 10 Mar 2025 05:21:53 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e60f212fee7so3009879276.1
 for <qemu-rust@nongnu.org>; Mon, 10 Mar 2025 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741598509; x=1742203309; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a9kXDjFxTemfhCDsR7y7sBVjDH2Rsj9X0LFfEidaQ7o=;
 b=Md3GEjDkubWis43B4n2ybqs1B8efDlJtspgaTPTJjxrMQ+RAvBquTgAl7Nj/cuy+US
 v2y8cOMACWwtG9V/vQbfJa3cWzpxpNucnKKSX9cDyZ4SXeoDZPoNt5j9r++VWk1I6bnY
 1U3AutyXBAw7Iix1Rfy0OvROqtuSBgQOdGIutgEssgCvj1SyW0YzhQlZMvHsQ5AarrKe
 5jYyWWi6BqYJwkLO8A8UkpN7qMA2h1/JlaR81Z5m1ttKfneAFmhFK+m8ecHmDqU9+JSY
 ljeTImFVZcwkcRlbxUG6hkMaFjmLjpk6JID1nKAH77JNnQtg8SBFEs0M0kFFpPFXTbHH
 y3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741598509; x=1742203309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a9kXDjFxTemfhCDsR7y7sBVjDH2Rsj9X0LFfEidaQ7o=;
 b=jTeCiJ/34kH1nFOYKtMf9p7HYw12ZTEGxB9twXElMWTebsDmtlG+DPb2rxgoFcXTf+
 DwhShb+6iHpJfK81F1TIlc1qgEc6078z0o/zV8cegNOFs3cVaEqtYBg1HNrP5e3Fn5Ej
 LSgqciHaI5A+gJNs91Im7gIrfrNf7+EEX0WOeCyCBNT85I2anM5cKwXFSuKeqNF+fxz0
 p4yYZBoCNGzXO80roToqzJJZnQlhjXi5QSaPFqSXqjJ+8EABJUNjVb0o8/K0NLIGH95h
 YqmW6iPqRO7/pSZwdro2kJ0QL+OGn8IL+NlRDxCoGhO34MLPDyo/SnhSC9zdkVVgCGQy
 9HSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGe9bAcCTN50SYePJUPaOkq0afIf7uP6qkPPSkqiHnAlOacjuDj0V8D9u8gmLLe2edOdiRrn3dXrA=@nongnu.org
X-Gm-Message-State: AOJu0YxskBOObh7sTU/yjTjAnchxa0wZao72uBQFbXhTt/Hna6neRAFY
 6s9WdFnS+b+iHrelVWpk1IEn6PCwbEnDioRR8BZHFykhh3MbXtsNEFdiAzUlbf22s7LaebDSKPU
 BbUxfoiLnFyjojf2xvulAGwaIGrePMx8TFA0qbw==
X-Gm-Gg: ASbGncuzJieZkWnBwJ6hJnEoBJ75nFknn5aYlMswAtr7VNVsgxdOaGewt0XjzbP48Df
 zQnf/ZUgTR3sh73kLCyFtW3JAj0E66dBjIcqnoLYbVa96aFVaMdXppkrU5khanPd4hiTw5h3JW7
 QLbfdjiVfKAs6ex283RwIol7hXxOk=
X-Google-Smtp-Source: AGHT+IGghKX1xMXFfNOEB7W6IqN3zKNeLBfL9w4xJWR+pG5Z7/FKpWtHodrz5Ukdm8PWHiw7Gq1izMUxm4eFHWF1UNU=
X-Received: by 2002:a05:6902:1201:b0:e57:87b3:d2e0 with SMTP id
 3f1490d57ef6-e635c10191cmr18229782276.3.1741598509109; Mon, 10 Mar 2025
 02:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250129082045.1319203-1-pbonzini@redhat.com>
In-Reply-To: <20250129082045.1319203-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Mar 2025 09:21:37 +0000
X-Gm-Features: AQ5f1Jq5stmSoKjijHUzDxEGedI2RntT7xSQFoiE5r9bRwQ9oollASvgtL5Tm7w
Message-ID: <CAFEAcA9=G4sdXrxWcmq9wMqu1-ZRNxObQD3hmnFauYwiQr_8YQ@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: include full Rust backtraces in test runs
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-rust@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Mar 2025 09:21:54 -0000

On Wed, 29 Jan 2025 at 08:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .gitlab-ci.d/buildtest-template.yml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 39da7698b09..4cc19239319 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -63,6 +63,7 @@
>    stage: test
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
>    script:
> +    - export RUST_BACKTRACE=1
>      - source scripts/ci/gitlab-ci-section
>      - section_start buildenv "Setting up to run tests"
>      - scripts/git-submodule.sh update roms/SLOF
> --

This will only add the rust backtraces when the tests
are run from the CI logs, not when you locally run
"make check" or similar. There's probably a better place
to put this...

-- PMM

