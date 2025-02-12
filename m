Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ti7Kd-0007bi-UD
	for mharc-qemu-rust@gnu.org; Wed, 12 Feb 2025 02:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ti7KV-0007aW-Ak
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 02:38:45 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ti7KS-0006eH-BQ
 for qemu-rust@nongnu.org; Wed, 12 Feb 2025 02:38:43 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4394c192285so14598745e9.0
 for <qemu-rust@nongnu.org>; Tue, 11 Feb 2025 23:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739345914; x=1739950714; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XjGq5iF46lcFDHS1AxT+2K4VukBprb3w6v585nZjGg0=;
 b=Iqu7mEa7yTaKDMjh6OQgiZrSaR14TF5A7taAWC/bxQHLdWx9DMfmfdgExgHP6gnl2U
 LituTAoeRWNrm03x6erhCIjEy8vlppXD5z4EvSjeG16ueO6oe7hrb9llvLh1EAtIh5TV
 S9CUQGd2h2yOMrrK3YPDSlIoECfIaVcToX3W2lYtN+E/bSa7FHQv3uC+OkZkDPEbrhqt
 JiH92tC6V1Q1XdIZrgepoyIE9Tv1RlxumstKVQjoYVyodDbkOW+iluRVfqQb1Aph8Y9L
 PBpWNDp/dadanTrcw4xkBlXFdbKyMtT4JyT5JzTfsysj1JGTFsEw9ULIZjY0jlNaUQN2
 tjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739345914; x=1739950714;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XjGq5iF46lcFDHS1AxT+2K4VukBprb3w6v585nZjGg0=;
 b=OO0sDtxKK0VnIkWIOnBxrP7m9F/V34EHAMvhhhp4R5jB0GbfvBvitjOIsQ857JrRT3
 eKCk/AGKFFHn/3u8gAE2V3mm5h4Muckf98tfmbyxPuhfsfIAMQHcJPrVguqZvrQuNphl
 MYIHCEbCJrxU7I9nHevvTkBnV/bqFYuotMWVPwctmGil0jl3hD3ScqRy3DrgIHs37Zpw
 uTclpmNkQo8TSeEQOdl1Gwn/gIPLtFe68jdD8VXEN6osg7vJ+8ISMoU12P3n0RK7aliy
 jG0Qyz0AOVF66O8lkeN1NUujPTuizB8Wj1DKk3Q3h2Mm9lEbN5VnCkrFguan9+oJ13hQ
 Z8gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1NZC8O2Jt0roQLzvq72fFN/vDCR6yd9Vw8QBDekqqoM/uAeuxIdU/pKPOo+QvznPUYeFxZy42Xv0=@nongnu.org
X-Gm-Message-State: AOJu0YwfyducSsBYvnFovha7gUTBpAhxcKrl9XCGk/MXWDMYM56l/1E0
 A7nf9eUn6xpqYJuMa/7tw7RyXAGq/HCiQabv9oZttkC8gvb8oPf6COH9ss9FDIM=
X-Gm-Gg: ASbGnctFg12+eHOBa6J26ZTOj7C0U8EKItvdmwgQ68g9WfpQ29p6kTZLhpSRoJyLo33
 j4Ja405m5LhktkFyvsbppgt4Z1VkflxCow1UCbzTUVSok0gTnuM/6mrDk3KBg1Jd18wPhFv+X7N
 CdqP75NKZ+lehFRaQe1O9cJellxkYzZvIWH1pab74v20k3yHxB3Eakr0PLv82xxI/uOU8WaeUmW
 J1qw1nNZoKkUE6nDHtMNJzzh1mZPlzDlV+aHxmFB79phC2iPlVpPFpWmUKmOFBFwYUkpmj2CkmF
 uxMAsYx/l1EbS+MD+QbMP+6vMEzgOFukNtR+9EIb+h00XNvJaiAzu0b7RPA=
X-Google-Smtp-Source: AGHT+IF0z+gUiwV8FtBkeok0RrvEAheJ9T42IeiQhMatM+3TEtCVi+Y42LKXYz911/hAWUnLS4XewA==
X-Received: by 2002:a05:600c:19c6:b0:439:5506:717f with SMTP id
 5b1f17b1804b1-4395816a118mr17553295e9.9.1739345914283; 
 Tue, 11 Feb 2025 23:38:34 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06abfbsm11373295e9.19.2025.02.11.23.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 23:38:33 -0800 (PST)
Message-ID: <de118836-492c-43d4-9038-0045b87c3e37@linaro.org>
Date: Wed, 12 Feb 2025 08:38:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] meson: Add rust_block_ss and link tools with it
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, manos.pitsidianakis@linaro.org,
 qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250211214328.640374-1-kwolf@redhat.com>
 <20250211214328.640374-3-kwolf@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250211214328.640374-3-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 12 Feb 2025 07:38:46 -0000

On 11/2/25 22:43, Kevin Wolf wrote:
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   meson.build                | 36 ++++++++++++++++++++++++++++++++----
>   storage-daemon/meson.build |  2 +-
>   2 files changed, 33 insertions(+), 5 deletions(-)


>     if have_rust and target_type == 'system'
> -    target_rust = rust_devices_ss.apply(config_target, strict: false)
> +    target_rust_ss = ss.source_set()
> +    target_rust_ss.add_all(rust_block_ss)
> +    target_rust_ss.add_all(rust_devices_ss)
> +
> +    target_rust = target_rust_ss.apply(config_target, strict: false)
>       crates = []
>       foreach dep : target_rust.dependencies()
>         crates += dep.get_variable('crate')
> @@ -4349,15 +4354,38 @@ if xkbcommon.found()
>   endif
>   
>   if have_tools
> +  tools_deps = []

To simplify, we can likely start with:

      tools_deps = [qemuutil]

Maybe clearer to introduce tools_deps[] as a preliminary
patch although.


