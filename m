Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uM1k9-0005pz-0b
	for mharc-qemu-rust@gnu.org; Mon, 02 Jun 2025 05:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uM1jz-0005oN-BQ
 for qemu-rust@nongnu.org; Mon, 02 Jun 2025 05:45:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uM1ju-0001NA-Kl
 for qemu-rust@nongnu.org; Mon, 02 Jun 2025 05:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748857550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sOABQMiaSUNvVZN7w4weKj3AXpGQsNA33epBnUhjM44=;
 b=Us2pIj428XjpZeXbm7pbeVZbGU8eeBKwDbS4ZAxLE7obSku1r9lNeCvEb5aAkBPUJu6YzD
 MQvHE6qvuWN8ZMN9GCnLP7KqDqi5z5ZUIFzZdSRfLQum97oh4Ker9H7Y6F5OIbbji323zb
 /JKLDmehOuwkUCoab3LWMfR93tIgJOk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-jE7EuqalMYmrHvzAwFEm1w-1; Mon, 02 Jun 2025 05:45:48 -0400
X-MC-Unique: jE7EuqalMYmrHvzAwFEm1w-1
X-Mimecast-MFC-AGG-ID: jE7EuqalMYmrHvzAwFEm1w_1748857548
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4f7ebfd00so1384789f8f.2
 for <qemu-rust@nongnu.org>; Mon, 02 Jun 2025 02:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748857548; x=1749462348;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sOABQMiaSUNvVZN7w4weKj3AXpGQsNA33epBnUhjM44=;
 b=h+zZedClqnL6IlLenpUXnTDf7XB0ACyFekpGsSMO9n6HvD7PaRvIXADzwRVpA84USl
 sqhE0xyu6F6/5tP21iLuxb7naMa6UEie4xmHJY9LySmpZ/OVxPZrgI0P+Tcvv62uVDn6
 NLGLfrOdDJBw3Sr4FfjzCTfkpfdXDOAmLNTJVNHUPO2u9dLwQuJa5fzm/hpjqvPAkjjn
 2FPwKRndRkTxewM3sjiYF8j9B/cM3yxbAIxTUUwPw5RFdj3bOPesAHXUIOrYQtg907uX
 Vccxni7rLCcNqpMIV2W06Oe7ObBQr1hz7qxudWgW8mRHXzCIFJyvtxzQWWdSkvJMxDw8
 OIZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0QAGlO5SjcWognkBwM1Vt0HwuQv18BfnE5IwPK+98cotfzW6iYwd85YlTg+FaBxwiOFHudj0XNWM=@nongnu.org
X-Gm-Message-State: AOJu0YyF+Vw8+R4Y/AUoFTYm2WRhBByTDuxCf06d1sSbOkQb7z747wJZ
 CQNHOhcmif6wG4V6ZBQesWiRvr2t5D0AgOAE8NAruIW+dl3QCINb7SjJ3QCSNbwNsSuvs+vmDWh
 KGdBLcIaahXEX8/asoNtt8ofAE5o6w1pX36fMubjHbIOlobLsq1CYPg0=
X-Gm-Gg: ASbGnct1/BN9EvOUWG8eiXPz6lUWiOwT1XaDGjkqIlNQzEbGuUk2lowa+Y9Aqu6moeP
 BX+A+8vDsWxu+BlVi/tRdP7cR1iT7Fw7D0+R61ZQ3qxZf6ZGEugXHZr1ReKjBq+a4W5hg7nrcH0
 jel6Vg8DnZCfIURsYW0ZZtZucIoVJUDo2Ns3x4L2nsVPhLJwgB/C/3+kd3QotPC91qe7+p2zIdb
 IG4JIgz1W5PC7bXDNkcJIE2cWBcewn7vXK3UjbaWsom0Hfk0p7HT+K0AhMF4HtVBDXlxTQy4f20
 AzcH88sraNy4irM=
X-Received: by 2002:a05:6000:18ab:b0:3a4:ea40:4d3f with SMTP id
 ffacd0b85a97d-3a4f7aafa70mr11404096f8f.53.1748857547791; 
 Mon, 02 Jun 2025 02:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7EjSpIatYNI20kC+RsKecY91KFhewaeyHwOu4qZ3VjxTlz35QAyv3tJvdf3iH9xd/8TPb4Q==
X-Received: by 2002:a05:6000:18ab:b0:3a4:ea40:4d3f with SMTP id
 ffacd0b85a97d-3a4f7aafa70mr11404080f8f.53.1748857547453; 
 Mon, 02 Jun 2025 02:45:47 -0700 (PDT)
Received: from [192.168.76.123] ([151.49.64.79])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb7e41sm113982595e9.26.2025.06.02.02.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 02:45:46 -0700 (PDT)
Message-ID: <8844c934-1790-49fb-8e55-d3461b32e8f3@redhat.com>
Date: Mon, 2 Jun 2025 11:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] rust: bindings for Error
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
References: <20250530080307.2055502-1-pbonzini@redhat.com>
 <87y0uamvm6.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <87y0uamvm6.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0S0Hn_cAWS_bv32MF0iCtpHhoisZXEjwf-pvwKdq8dk_1748857548
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.071,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 02 Jun 2025 09:45:59 -0000

On 6/2/25 09:49, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> As explained for v1, the impetus for this series is to remove BqlCell<>
>> from HPETState::num_timers.  However, it's also an important step for QAPI:
>> error propagation is pretty central for example to QMP, and the series
>> is also a first example of two-way conversion between C and native-Rust
>> structs (i.e. not using bindgen-generated structs or their opaque wrappers).
>>
>> As an aside, support for NUL-terminated file is now scheduled for
>> inclusion in Rust as "panic::Location::file_with_nul()", but it will be
>> quite a while before QEMU can use it.  For more information, see
>> https://github.com/rust-lang/rust/issues/141727.
> 
> Doen't apply for me on current master (3e82ddaa8db).  What's your base?

I have a few more patches queued before this series.  For something that 
applies directly on top of master, you can check branch rust-next at 
https://gitlab.com/bonzini/qemu.

You'll also need Meson 1.8.1, which you can install via pip, because 
Daniel preferred not to have such a new version required for everyone.

Paolo


