Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAqFk-0003kQ-DP
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 09:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAo4o-0003Mf-8r
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:57:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAo4m-0007Q2-9h
 for qemu-rust@nongnu.org; Fri, 02 May 2025 06:57:05 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso8111465e9.3
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 03:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746183423; x=1746788223; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vj5HuKv9glVT8gzdZRhVYIHfs8SfQJDKua/Qa0b7zos=;
 b=cZFAphMMeaS8jPpEEi/9WA8ROpSVnkZN6bpX/svpD1MsHpsumIAnwWhZsszL3QoWJ6
 dxlbMydhpDSD+TcWqjEQvM13YhNOTWj/j0GCwSXAxoYa+CN1hUm/OrNnrJyJJ60UR8wy
 J3EEiUIwCCh55ehJq5hsnV2iHEZuddV6XH4vjH14VPG0zL6JOxUF1S+UVeiY5EoBRfdV
 qHf5BbPUQdVYnwcXRLMyyYdRN6JSFPvItmuv4F70cdmAeMZRqllZmWAu0szKEP6bN4Bo
 98BmBSRjdbxVxDSSernkluomouRU2bNEGNwCU/9YQroG9Ritd8MTgvE+pBGSrvD8/RZm
 6tPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746183423; x=1746788223;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vj5HuKv9glVT8gzdZRhVYIHfs8SfQJDKua/Qa0b7zos=;
 b=PyjFJMkW/hOKmd2JJGIH6Ipv0ltr5CmRvJ6R1kVfifpsgCpxeoK2FV8MDjAQ1uZ9zc
 1yvikoRBySrk58kNXWTcISZVYgwqvCMcfJtnHKdUWxujcv4MHVdFjrV82HQwwxZ6TOs5
 muGSGfTIKVqzqeb4ZJVDr6A/E69UQB0+1ltRA57yikW7mkHUK/e84RlVABxSuBqOzCIl
 vMr9yW+mItFQv3KmCLO1qkkvXbudgDKkAcFlcnomT9vpc/0EKH45arkgX5TYxzUc4r4a
 AnBymak3iEmNVmjRUdW+RzmxFKBtEpkdOvoMK8Ys+c+f7uz8iSrmyBOc6PYhXDXWTTCC
 ryUg==
X-Gm-Message-State: AOJu0YxyvvLXY1MmEPvE1ZaEl9a2SiFE7dmqCPo/EpGwkdiOcg21w8Bq
 Q7t95C+G1nRoCfdLsxB3DMM/fGPCc/Yu6OIjxPQfd18Y4tBUAaPxtA4td17liac=
X-Gm-Gg: ASbGncuZDz4/VDzY8CYTBPhP2ZYb3tS48zlJ1XFFNXxDNPxEZc8VuccFKYPglIPLOjJ
 JVvfjovnM9GJ/B0lXdlwl1tMEQnRJXGaH59YNwnjvztP8gX/rM6gVFtA6s90SAVYzvvXkK2vcJD
 mNMBiKmMb5/rOEhzmwurhdKz2FQlO3W23HCBL1pyRosGqmF9tB+KZnL9rNHEVErbdYOH3BDwWLK
 HhnHsD/Bq+tCgMFegLkvZEEydp+/a/3hb77nDqc48BeAeE/4cO2arWAigGdhqfn88J7aFfM8dUS
 HBLuhFJjbTb0zpT4OL4bFtUn0dmswsAr4jfeYiJkHwMhIOSWgg+x+U6L+Z+0sPfD9zkFB6POI8M
 OnZZ2JQ==
X-Google-Smtp-Source: AGHT+IHGNTBBOgX82T5ORi3HjaUolZAwYOXAL04GOhkaDD5BCgmTQRERhnqDM+cnpKptc27ZxKtu6A==
X-Received: by 2002:a05:600d:10:b0:441:bf4e:89c8 with SMTP id
 5b1f17b1804b1-441bf4e8b11mr10844085e9.3.1746183422702; 
 Fri, 02 May 2025 03:57:02 -0700 (PDT)
Received: from meli-email.org (adsl-37.37.6.161.tellas.gr. [37.6.161.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b20a65sm85968975e9.32.2025.05.02.03.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:57:02 -0700 (PDT)
Date: Fri, 02 May 2025 13:54:13 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-rust@nongnu.org
Bcc: 
Subject: Re: [PATCH 0/9] rust: allow minimum version of 1.77
User-Agent: meli/0.8.12
References: <20250502102323.104815-1-pbonzini@redhat.com>
In-Reply-To: <20250502102323.104815-1-pbonzini@redhat.com>
Message-ID: <svmrr1.1reefsjrvnmr2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 02 May 2025 09:16:24 -0400
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
X-List-Received-Date: Fri, 02 May 2025 10:57:06 -0000

Hey Paolo,

We should update the version check in the root meson.build in the first 
patch of this series:

> if have_rust
>   rustc = meson.get_compiler('rust')
>   if rustc.version().version_compare('<1.63.0')
>     if get_option('rust').enabled()
>       error('rustc version ' + rustc.version() + ' is unsupported. Please upgrade to at least 1.63.0')
>     else
>       warning('rustc version ' + rustc.version() + ' is unsupported, disabling Rust compilation.')
>       message('Please upgrade to at least 1.63.0 to use Rust.')
>       have_rust = false
>     endif
>   endif
> endif

