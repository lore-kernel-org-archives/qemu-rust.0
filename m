Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uHPM8-0005ep-CS
	for mharc-qemu-rust@gnu.org; Tue, 20 May 2025 11:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHPM3-0005eF-Sx
 for qemu-rust@nongnu.org; Tue, 20 May 2025 11:58:11 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uHPM1-0004RE-SR
 for qemu-rust@nongnu.org; Tue, 20 May 2025 11:58:11 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-70ccf9a4ab3so26243137b3.1
 for <qemu-rust@nongnu.org>; Tue, 20 May 2025 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747756687; x=1748361487; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zq/GEVJhhDgOVQYKrZa039iqFHl3+Fylcx95s374NQk=;
 b=PO3jxe30quBHo0k5BwFkkuffwGjitGT7cwSK9SOAHKi/lBSbqNPxzc32Akml2pueVe
 hoXeAByHTJ2Tk6sOEvsWDsjz6ocEr4/Blews1u6jzyPFyU93z7pAZNhwDSg5JGkYZFop
 gSlJdRye9HTlQtYXWA1iCTyOC++ucsSRZdhg/NrBFKMSjf6Vr5s8OFtMzy0qLcOtA5Ue
 MyBDWt3wgqwFbXckqzoEJoZwC73rICPkbbEvqLtwK2MmRoPbbx7rkZuAlPtBRrEcyexi
 vueXN8/Ij1xF9U9Sv3bfPWlDWYhMJREfFErHNPQAMEZuK9S72vpTfNDlUox2L6wLg3x+
 kuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747756687; x=1748361487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zq/GEVJhhDgOVQYKrZa039iqFHl3+Fylcx95s374NQk=;
 b=GzDl30fkEcMIrWJq6DVcfAtjqImr44wrP2mBmPdGFhMT2D5Bmptvzy3uAowC0Ag61o
 usbPE5Y+mG2w8QP3CnKbLpqXQ1tpI0wpZ0jvgytfvUnhjMDTyeiAbNAa5nuBRp5Cmo44
 vBMssajgcxVFZJM5enBXxo/6tYdvGhDQ1Xoo6y5K77DjECleD0/sCXxH1FU4ciDI1iHi
 Xx401Pr4BBliWukeggRdlhojzSZtYVEF/pX+dMtyDUUpgW43MGi5BOmAHUh2e0Nl1XNV
 p1MrlXBUowcq6Hp0uIqj1ADhav1ux3vBLbjQhLdQhqJUv+mGY8KxyLfYCakIN0t9wcQ1
 UJ5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUpS3vaVR5nBgHZBEbEmc+fUQl8CewQjKGqrMZKBMJJNJ3aNDayu78f2DyTwt/euDXWTXXLTXqFvE=@nongnu.org
X-Gm-Message-State: AOJu0YzBxQtGC2F+t37RxdB1+O5i9lVvB/zEOQnePTIkX5TyNi486jDR
 wxyVcbrY7zgHrtbmmiOTqFJEqu1hNTXWjpBaeQc1R8a6PO5dEZs0Ux1oDcTAZrg62pvXHybylF1
 XzY13RQPKo3vHmpMIy/3XxmgZmOf+vKam42+mlrO68A==
X-Gm-Gg: ASbGnctNxitXUKIzF0E6rlPsP50Hgb6pzPC/cOt9EmkUrPUEvDLaepeZBopUcOgl5vI
 Ncz6YUaNIEdUppp5fHcKF5cD0E+YmSlperCI+jtQdpOeNd/t9TkA/ZVFtkevmnYlSN9i5FMZPYE
 6aXnt/8XJz18l/CXUa18Wd6A5BqowIMKQBNA==
X-Google-Smtp-Source: AGHT+IHgq2qpX/TKV0lQVJIt395ndFq9Sm2qq4ctb47b0K302eCK4QAEgKKL1C8Jzb2GqD8ubrjmYRDaVMp3Qbvm1gQ=
X-Received: by 2002:a05:690c:6c02:b0:702:d85:5347 with SMTP id
 00721157ae682-70cab109857mr221045177b3.36.1747756686992; Tue, 20 May 2025
 08:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152750.2542612-1-zhao1.liu@intel.com>
 <20250520152750.2542612-5-zhao1.liu@intel.com>
In-Reply-To: <20250520152750.2542612-5-zhao1.liu@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 May 2025 16:57:54 +0100
X-Gm-Features: AX0GCFtmTkT8uefvGoOGOfVedfpMhoQWrVuKYA_aa0BwK7pxY3kcMsQ8MruaeNI
Message-ID: <CAFEAcA9y-WRTGo5um1iwNi5FJOwuayeNLiOw88s=1vssqncRSQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: Fix Zhao's email address
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-rust@nongnu.org, Dapeng Mi <dapeng1.mi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-List-Received-Date: Tue, 20 May 2025 15:58:12 -0000

On Tue, 20 May 2025 at 16:09, Zhao Liu <zhao1.liu@intel.com> wrote:
>
> No one could find Zhao Liu via zhai1.liu@intel.com.
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

