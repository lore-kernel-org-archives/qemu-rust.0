Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uAqG5-0003nH-FM
	for mharc-qemu-rust@gnu.org; Fri, 02 May 2025 09:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAoFX-00070k-6N
 for qemu-rust@nongnu.org; Fri, 02 May 2025 07:08:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uAoFV-0003lK-2r
 for qemu-rust@nongnu.org; Fri, 02 May 2025 07:08:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4394a823036so17872615e9.0
 for <qemu-rust@nongnu.org>; Fri, 02 May 2025 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746184087; x=1746788887; darn=nongnu.org;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rpc911MSRyybCnIO826qwe1uZefKxahvBxjSAOaVQ2U=;
 b=GFujG4gDxligj6IP9EZlkVT8x7lXFCFiOiTa6c4IffRyjiG16fjFFZA3DDGkpYvzU5
 8mKi+SQ9l8k4va+fhQfXBwFzv2mJ5Ktg5cbueDVgPqhX234nUS7pGcpnDJR43dPPJKCM
 3dJ/eRext+yhXTTqWB8VFuNZi//2z6O0+6RfU/sVmQQtXN+yy3A3ooEjEzSd/vgk5CpT
 vmPhtb6hGgiopfIDPkZmhYiI8DJo/tssH19wtABlzb+1NqRlotsAx8RlDIK1EAS4HViK
 2Yxz4KwvEtQM8y+9DQsfccfTFbiGs7KXPffZZdwIjyWMEEz3eaYaAaZobnI2jznnQ2Sa
 1ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746184087; x=1746788887;
 h=mime-version:message-id:in-reply-to:references:user-agent:subject
 :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rpc911MSRyybCnIO826qwe1uZefKxahvBxjSAOaVQ2U=;
 b=t8bOd6J+1/xfacsghEN7/GSbBtiNXGpwCkm+x2vn/csDKgI2baAfZlrRgJFsBH6a/e
 oiHhHWw9uPNVkGuRjRadg1cht7OfZvfYbJjop0kjwsViwNVUMMottO4GutnxyvS7DmCL
 gmVrHsRhd+U3CkWr+4OajqIXfQ9/Wt5jRTTwaSkYjEoyBFo5EbYeO1w22aJ+fFY9OsFI
 5hL/DHL8cy0l9EWOB1q0VMu1CBac5gHcAzoVjUEStGydneMzSCMCFK/aLcCUM2sV46is
 XbhVb36MBjFNkZ2wu6i1XHl50Eds9eMDDc2Zm1G0Z4VkEBMVOVN/xTfjt58QgpHvf0tR
 roQA==
X-Gm-Message-State: AOJu0Yy8Ca3Tyf3jfjbplcimJF/RDJ5JZxLF6sCkD29m1m5RAzIWfBhs
 JvWISVZyvBis9pJiMhiBNOJgYMs0gKvKV9s3kVHUYixqWSHAl64fcXu+b7vnF90=
X-Gm-Gg: ASbGncvX4/E/CeG8NZomBGMP38xn15TAZw3cM6GnFZJVtM7kUj4/aTSfga9b3zHlOCp
 hjtnRijZNn9SRuYpXBaSlmCMuO0m1bEn6+Xg2rvssGvCFPntxvU3EjU0nJ12fBGh80sQCHfatoA
 Y8P3BhGFtVViORb1YaGaEDsgF9tUhZkYI7fDl6xAuLw7lesLQtTxIx15OeHUkkRJzjogc5J4a6G
 HmqM44PNqmbnDree9IqVjfkykxo77/E7UzI9Dvvk3B8HSp3L5M6T/wRV6NvQe8dPEz/BC8zvtnI
 3w52BKjCN+L8WFnMB7PNIlFP1nLYwMYYPgLQ41HK73R+Phnsk4+s727mIfC4aCqtKyupKEgpPSs
 E/rVrAg==
X-Google-Smtp-Source: AGHT+IHoZ7i2elVk+YwaAr62pmR6X6acZLybsbDLi/4nMXa1ztqTtwjcIbzyH4O+CBNyyIODC/vKKw==
X-Received: by 2002:a05:600c:cca:b0:43d:7bfa:2739 with SMTP id
 5b1f17b1804b1-441bbf34750mr17915975e9.23.1746184087371; 
 Fri, 02 May 2025 04:08:07 -0700 (PDT)
Received: from meli-email.org (adsl-37.37.6.161.tellas.gr. [37.6.161.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8a315fdsm40686455e9.34.2025.05.02.04.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 04:08:07 -0700 (PDT)
Date: Fri, 02 May 2025 14:01:42 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-rust@nongnu.org
Bcc: 
Subject: Re: [PATCH 5/9] rust: use MaybeUninit::zeroed() in const context
User-Agent: meli/0.8.12
References: <20250502102323.104815-1-pbonzini@redhat.com>
 <20250502102323.104815-6-pbonzini@redhat.com>
In-Reply-To: <20250502102323.104815-6-pbonzini@redhat.com>
Message-ID: <svms9i.274a4or3m08g3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Fri, 02 May 2025 11:08:18 -0000

On Fri, 02 May 2025 13:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> docs/devel/rust.rst              |   4 --
> rust/hw/timer/hpet/src/fw_cfg.rs |   6 +-
> rust/qemu-api/src/zeroable.rs    | 104 +++++--------------------------
> 3 files changed, 18 insertions(+), 96 deletions(-)

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

BTW There's this TODO in qom.rs, ObjectImpl trait

>   /// `&mut T`.  TODO: add a bound of 
>   //[`Zeroable`](crate::zeroable::Zeroable)
>   /// to T; this is more easily done once Zeroable does not require a manual
>   /// implementation (Rust 1.75.0).
>   const CLASS_INIT: fn(&mut Self::Class);

